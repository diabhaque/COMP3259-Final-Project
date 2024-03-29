{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_project (
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

bindir     = "/Users/diab/Desktop/Studies COMP3259 PPL/Final Project/code/.stack-work/install/x86_64-osx/c92347e8c6f2055ea26c5ee650bf0e7a79e647b55fac8346f73bc4f9e0f483a8/8.10.7/bin"
libdir     = "/Users/diab/Desktop/Studies COMP3259 PPL/Final Project/code/.stack-work/install/x86_64-osx/c92347e8c6f2055ea26c5ee650bf0e7a79e647b55fac8346f73bc4f9e0f483a8/8.10.7/lib/x86_64-osx-ghc-8.10.7/project-0.1.0.0-AvbaBtDZAL8DlqgwXsI045-spec"
dynlibdir  = "/Users/diab/Desktop/Studies COMP3259 PPL/Final Project/code/.stack-work/install/x86_64-osx/c92347e8c6f2055ea26c5ee650bf0e7a79e647b55fac8346f73bc4f9e0f483a8/8.10.7/lib/x86_64-osx-ghc-8.10.7"
datadir    = "/Users/diab/Desktop/Studies COMP3259 PPL/Final Project/code/.stack-work/install/x86_64-osx/c92347e8c6f2055ea26c5ee650bf0e7a79e647b55fac8346f73bc4f9e0f483a8/8.10.7/share/x86_64-osx-ghc-8.10.7/project-0.1.0.0"
libexecdir = "/Users/diab/Desktop/Studies COMP3259 PPL/Final Project/code/.stack-work/install/x86_64-osx/c92347e8c6f2055ea26c5ee650bf0e7a79e647b55fac8346f73bc4f9e0f483a8/8.10.7/libexec/x86_64-osx-ghc-8.10.7/project-0.1.0.0"
sysconfdir = "/Users/diab/Desktop/Studies COMP3259 PPL/Final Project/code/.stack-work/install/x86_64-osx/c92347e8c6f2055ea26c5ee650bf0e7a79e647b55fac8346f73bc4f9e0f483a8/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "project_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "project_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "project_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "project_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "project_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "project_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
