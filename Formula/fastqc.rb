require 'formula'

class Fastqc < Formula
  homepage 'http://www.bioinformatics.babraham.ac.uk/projects/fastqc/'
  url 'http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.2.zip'
  sha256 'f362b141e696d67442fa16c3a71118936e0b14a0343bb88735973a920cbaef09'

  def install
    chmod 0755, 'fastqc'
    prefix.install Dir['*']
    mkdir_p bin
    ln_s prefix/'fastqc', bin/'fastqc'
  end

  test do
    system "fastqc", "-h"
  end
end
