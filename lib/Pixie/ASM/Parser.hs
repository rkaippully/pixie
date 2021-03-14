module Pixie.ASM.Parser where


import Relude


data Instruction = OpAdd Register Register (Either Register Imm16)
                 | OpSub Register Register (Either Register Imm16)
                 | OpMulBI Register Register Register
                 | OpMulSI Register Register Register
                 | OpMulWI Register Register Register
                 | OpMulBU Register Register Register
                 | OpMulSU Register Register Register
                 | OpMulWU Register Register Register
                 | OpNeg Register Register
                 | OpCmp Register (Either Register Imm16)
                 | OpAnd Register Register (Either Register Imm16)
                 | OpOr Register Register (Either Register Imm16)
                 | OpNot Register Register
                 | OpXor Register Register (Either Register Imm16)
                 | OpShfL Register Register (Either Register Imm5)
                 | OpShfRZ Register Register (Either Register Imm5)
                 | OpShfRA Register Register (Either Register Imm5)
                 | OpJC Address
                 | OpJCn Address
                 | OpJCp Address
                 | OpJCz Address
                 | OpJCnp Address
                 | OpJCnz Address
                 | OpJCzp Address
                 | OpJCnzp Address
                 | OpJmp Address
                 | OpCall Address
                 | OpScl Imm6
                 | OpRet
                 | OpRetI
                 | OpRetS
                 | OpLdB Register Address
                 | OpLdS Register Address
                 | OpLdW Register Address
                 | OpStB Address Register
                 | OpStS Address Register
                 | OpStW Address Register
                 | OpCpy Register Register
                 | OpCpyI Register Imm16
                 | OpCpyU Register Imm16
                 | OpPushI Imm16
                 | OpPushU Imm16
                 | OpPushB Register
                 | OpPushS Register
                 | OpPushW Register
                 | OpPopB Register
                 | OpPopS Register
                 | OpPopW Register
                 | OpIn Register (Either Register Imm8)
                 | OpOut (Either Register Imm8) Register
                 | OpSssp (Either Addr20 Register)
                 | OpHalt
                 deriving stock (Show, Eq)

newtype Register = Register Int32
  deriving stock (Show, Eq)

newtype Imm5 = Imm5 Word8
  deriving stock (Show, Eq)

newtype Imm6 = Imm6 Word8
  deriving stock (Show, Eq)

newtype Imm8 = Imm8 Word8
  deriving stock (Show, Eq)

newtype Imm16 = Imm16 Int16
  deriving stock (Show, Eq)

newtype Addr20 = Addr20 Word32
  deriving stock (Show, Eq)

data Address = AddrAbsolute Addr20
             | AddrRegIndirect Register
             | AddrRegIndirectIndex Register Register
             deriving stock (Show, Eq)
