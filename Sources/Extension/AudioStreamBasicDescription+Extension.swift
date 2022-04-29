import CoreAudio
import Foundation

extension AudioStreamBasicDescription: Equatable {
    public static func == (lhs: AudioStreamBasicDescription, rhs: AudioStreamBasicDescription) -> Bool {
        lhs.mBitsPerChannel == rhs.mBitsPerChannel &&
            lhs.mBytesPerFrame == rhs.mBytesPerFrame &&
            lhs.mBytesPerPacket == rhs.mBytesPerPacket &&
            lhs.mChannelsPerFrame == rhs.mChannelsPerFrame &&
            lhs.mFormatFlags == rhs.mFormatFlags &&
            lhs.mFormatID == rhs.mFormatID &&
            lhs.mFramesPerPacket == rhs.mFramesPerPacket &&
            lhs.mReserved == rhs.mReserved &&
            lhs.mSampleRate == rhs.mSampleRate
    }
}

extension AudioStreamBasicDescription {
    public struct AudioFormatReadableFlags: OptionSet, CustomStringConvertible {
        public enum Flag: String, CaseIterable, CustomStringConvertible {
            case audioFormatFlagIsFloat = "kAudioFormatFlagIsFloat"
            case audioFormatFlagIsBigEndian = "kAudioFormatFlagIsBigEndian"
            case audioFormatFlagIsSignedInteger = "kAudioFormatFlagIsSignedInteger"
            case audioFormatFlagIsPacked = "kAudioFormatFlagIsPacked"
            case audioFormatFlagIsAlignedHigh = "kAudioFormatFlagIsAlignedHigh"
            case audioFormatFlagIsNonInterleaved = "kAudioFormatFlagIsNonInterleaved"
            case audioFormatFlagIsNonMixable = "kAudioFormatFlagIsNonMixable"
            case audioFormatFlagsAreAllClear = "kAudioFormatFlagsAreAllClear"
            case linearPCMFormatFlagIsFloat = "kLinearPCMFormatFlagIsFloat"
            case linearPCMFormatFlagIsBigEndian = "kLinearPCMFormatFlagIsBigEndian"
            case linearPCMFormatFlagIsSignedInteger = "kLinearPCMFormatFlagIsSignedInteger"
            case linearPCMFormatFlagIsPacked = "kLinearPCMFormatFlagIsPacked"
            case linearPCMFormatFlagIsAlignedHigh = "kLinearPCMFormatFlagIsAlignedHigh"
            case linearPCMFormatFlagIsNonInterleaved = "kLinearPCMFormatFlagIsNonInterleaved"
            case linearPCMFormatFlagIsNonMixable = "kLinearPCMFormatFlagIsNonMixable"
            case linearPCMFormatFlagsSampleFractionShift = "kLinearPCMFormatFlagsSampleFractionShift"
            case linearPCMFormatFlagsSampleFractionMask = "kLinearPCMFormatFlagsSampleFractionMask"
            case linearPCMFormatFlagsAreAllClear = "kLinearPCMFormatFlagsAreAllClear"
            case appleLosslessFormatFlag_16BitSourceData = "kAppleLosslessFormatFlag_16BitSourceData"
            case appleLosslessFormatFlag_20BitSourceData = "kAppleLosslessFormatFlag_20BitSourceData"
            case appleLosslessFormatFlag_24BitSourceData = "kAppleLosslessFormatFlag_24BitSourceData"
            case appleLosslessFormatFlag_32BitSourceData = "kAppleLosslessFormatFlag_32BitSourceData"
            
            var flagValue: AudioFormatFlags {
                switch self {
                case .audioFormatFlagIsFloat: return kAudioFormatFlagIsFloat
                case .audioFormatFlagIsBigEndian: return kAudioFormatFlagIsBigEndian
                case .audioFormatFlagIsSignedInteger: return kAudioFormatFlagIsSignedInteger
                case .audioFormatFlagIsPacked: return kAudioFormatFlagIsPacked
                case .audioFormatFlagIsAlignedHigh: return kAudioFormatFlagIsAlignedHigh
                case .audioFormatFlagIsNonInterleaved: return kAudioFormatFlagIsNonInterleaved
                case .audioFormatFlagIsNonMixable: return kAudioFormatFlagIsNonMixable
                case .audioFormatFlagsAreAllClear: return kAudioFormatFlagsAreAllClear
                case .linearPCMFormatFlagIsFloat: return kLinearPCMFormatFlagIsFloat
                case .linearPCMFormatFlagIsBigEndian: return kLinearPCMFormatFlagIsBigEndian
                case .linearPCMFormatFlagIsSignedInteger: return kLinearPCMFormatFlagIsSignedInteger
                case .linearPCMFormatFlagIsPacked: return kLinearPCMFormatFlagIsPacked
                case .linearPCMFormatFlagIsAlignedHigh: return kLinearPCMFormatFlagIsAlignedHigh
                case .linearPCMFormatFlagIsNonInterleaved: return kLinearPCMFormatFlagIsNonInterleaved
                case .linearPCMFormatFlagIsNonMixable: return kLinearPCMFormatFlagIsNonMixable
                case .linearPCMFormatFlagsSampleFractionShift: return kLinearPCMFormatFlagsSampleFractionShift
                case .linearPCMFormatFlagsSampleFractionMask: return kLinearPCMFormatFlagsSampleFractionMask
                case .linearPCMFormatFlagsAreAllClear: return kLinearPCMFormatFlagsAreAllClear
                case .appleLosslessFormatFlag_16BitSourceData: return kAppleLosslessFormatFlag_16BitSourceData
                case .appleLosslessFormatFlag_20BitSourceData: return kAppleLosslessFormatFlag_20BitSourceData
                case .appleLosslessFormatFlag_24BitSourceData: return kAppleLosslessFormatFlag_24BitSourceData
                case .appleLosslessFormatFlag_32BitSourceData: return kAppleLosslessFormatFlag_32BitSourceData
                }
            }
            
            static func flags(from flagOptionSet: AudioFormatFlags) -> Set<Flag> {
                var result = Set<Flag>()
                allCases.forEach { flag in
                    if flag.flagValue & flagOptionSet == flag.flagValue {
                        result.insert(flag)
                    }
                }
                return result
            }
            
            static func flagOptionSet(from flagSet: Set<Flag>) -> AudioFormatFlags {
                var optionSet: AudioFormatFlags = 0
                flagSet.forEach { flag in
                    optionSet |= flag.flagValue
                }
                return optionSet
            }
            
            public var description: String {
                rawValue
            }
        }
        
        public let rawValue: AudioFormatFlags
        
        public init(rawValue value: AudioFormatFlags) { self.rawValue = value }
        
        public var description: String {
            let flags = Flag.flags(from: rawValue)
            let optionSet = Flag.flagOptionSet(from: flags)
            
            guard optionSet == rawValue else {
                fatalError("AudioFormatFlags doesn't match \(optionSet) vs \(rawValue)")
            }
            
            return "Flags: \(flags.description); Raw: \(optionSet)"
        }
    }
    
    public var readableFlags: AudioFormatReadableFlags {
        AudioFormatReadableFlags(rawValue: mFormatFlags)
    }
}
