require 'formula'

class Bowtie2 < Formula
  homepage "http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
  #doi "10.1038/nmeth.1923"
  head "https://github.com/BenLangmead/bowtie2.git"

  url "https://github.com/BenLangmead/bowtie2/archive/v2.2.3.tar.gz"
  sha256 "b5a034ae7c695a00a6a314fb557a07930755cfcd35a3c16f7cd9bdafd2eaecaf"

  def install
    system "make"
    bin.install %W[bowtie2
                   bowtie2-align-l bowtie2-align-s
                   bowtie2-build   bowtie2-build-l   bowtie2-build-s
                   bowtie2-inspect bowtie2-inspect-l bowtie2-inspect-s]

    doc.install %W[AUTHORS LICENSE MANUAL
                   NEWS README TUTORIAL VERSION]

    share.install %W[example scripts]
  end

  test do
    system "bowtie2-build", "#{share}/example/reference/lambda_virus.fa", "lambda_virus"
    assert File.exist?("lambda_virus.1.bt2")
  end
end
