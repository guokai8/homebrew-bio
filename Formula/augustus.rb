require 'formula'

class Augustus < Formula
  homepage 'http://bioinf.uni-greifswald.de/augustus/'
  url 'http://bioinf.uni-greifswald.de/augustus/binaries/old/augustus-3.3.tar.gz'
  sha1 '19f40b3b834aba0386646d9cb8120caf3f0eb64e'

  def install
      bin.install "bin/augustus"
      bin.install "bin/bam2hints"
      bin.install "bin/bam2wig"
      bin.install "bin/fastBlockSearch"
      bin.install "bin/filterBam"
      bin.install "bin/homGeneMapping"
      bin.install "bin/joingenes"
      bin.install "bin/prepareAlign"
    end

  test do
    system 'augustus --version'
  end
end
