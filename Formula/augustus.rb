require 'formula'

class Augustus < Formula
  homepage 'http://bioinf.uni-greifswald.de/augustus/'
  url 'http://bioinf.uni-greifswald.de/augustus/binaries/old/augustus-3.3.tar.gz'
  sha256 'b5eb811a4c33a2cc3bbd16355e19d530eeac6d1ac923e59f48d7a79f396234ee'

  def install
      bin.install "bin/augustus"
      bin.install "bin/bam2hints"
      bin.install "bin/bam2wig"
      bin.install "bin/fastBlockSearch"
      bin.install "bin/filterBam"
      bin.install "bin/homGeneMapping"
      bin.install "bin/joingenes"
      bin.install "bin/prepareAlign"
      bin.install "scripts/autoAug.pl"
      bin.install "scripts/autoAugPred.pl"
      bin.install "scripts/autoAugTrain.pl"
      bin.install "scripts/gff2gbSmallDNA.pl"
    end

  test do
    system 'augustus --version'
  end
end
