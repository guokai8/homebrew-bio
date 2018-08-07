require 'formula'
require 'os'

class Subread < Formula
    desc "High-performance read alignment, quantification and mutation discovery"
    homepage "https://sourceforge.net/projects/subread/"
    version "1.5.0-p2"

    if OS.linux?
        url "http://downloads.sourceforge.net/project/subread/subread-1.5.0-p2/subread-1.5.0-p2-Linux-x86_64.tar.gz"
        sha256 "080d2369cbdb3779c72c888192ceabd7fdd08a6648eddb2fbd3deda909251cbd"
    else
        url "https://sourceforge.net/projects/subread/files/subread-1.5.0-p2/subread-1.5.0-p2-MacOSX-x86_64.tar.gz"
        sha256 "276eddaf8ab591bacb3453dba2e76a459075d13c9cf4ee9f3587e8f7194223dc"
    end

    bottle do
        cellar :any_skip_relocation
        sha256 "00047e6b4307fbe67375e771d5497319cacfad1180810c6a51a25beea4a9294c" => :sierra_or_later
        sha256 "2b3a28e18767219af4e968b6e0e0415fe60129ef8518102d2b74668e6babb1c0" => :x86_64_linux
    end
    def install
      bin.install "bin/exactSNP"
      bin.install "bin/featureCounts"
      bin.install "bin/subindel"
      bin.install "bin/subjunc"
      bin.install "bin/subread-align"
      bin.install "bin/subread-buildindex"
    end

end
