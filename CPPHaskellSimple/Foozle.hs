{-# LANGUAGE ForeignFunctionInterface #-}
module Foozle where

import Foreign.C.Types

foreign export ccall foo :: CInt -> IO CInt

foo :: CInt -> IO CInt
foo x = return (x + 1)