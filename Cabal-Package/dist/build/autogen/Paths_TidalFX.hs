{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_TidalFX (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/calumgunn/.cabal/bin"
libdir     = "/Users/calumgunn/.cabal/lib/x86_64-osx-ghc-8.4.3/TidalFX-0.1.0.0-4SdvA26oDH24nyraj8yADc"
dynlibdir  = "/Users/calumgunn/.cabal/lib/x86_64-osx-ghc-8.4.3"
datadir    = "/Users/calumgunn/.cabal/share/x86_64-osx-ghc-8.4.3/TidalFX-0.1.0.0"
libexecdir = "/Users/calumgunn/.cabal/libexec/x86_64-osx-ghc-8.4.3/TidalFX-0.1.0.0"
sysconfdir = "/Users/calumgunn/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "TidalFX_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "TidalFX_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "TidalFX_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "TidalFX_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "TidalFX_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "TidalFX_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
