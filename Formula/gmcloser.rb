require "formula"

class Gmcloser < Formula
  homepage "http://sourceforge.net/projects/gmcloser/"
  url "https://downloads.sourceforge.net/project/gmcloser/GMcloser-1.2.tar.gz"
  sha256 "ba176fb0bc8869274b397d37e4635cd870e7a46f242186000728714b45fa017a"

  def install
    doc.install "Manual_GMcloser.pdf"
    libexec.install Dir["*"]
    (bin/'gmcloser').write <<-EOS.undent
      #!/bin/sh
      set -eu
      exec #{libexec}/gmcloser "$@"
    EOS
  end

  test do
    system "#{bin}/gmcloser --help"
  end
end
