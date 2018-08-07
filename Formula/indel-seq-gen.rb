class IndelSeqGen < Formula
  desc "Sequence simulation for divergent DNA and AA families"
  homepage "http://bioinfolab.unl.edu/~cstrope/iSG/"
  # doi "10.1093/molbev/msp174"
  # tag "bioinformatics"

  url "http://bioinfolab.unl.edu/~cstrope/iSG/indel-seq-gen-2.1.03.tar.gz"
  sha256 "4e9cf9d81eed573281fc69303fc35fe335c931496e7a403a7ea88d9b74c05d6f"

  depends_on "autoconf" => :build
  depends_on "automake" => :build

  def install
    # unknown symbol getpid()
    inreplace "src/main.cpp", "<stdio.h>", "<unistd.h>"
    # exit(EXIT_FAILURE) not declared
    inreplace "src/trace.h", "<sstream>", "<sstream>\n#include <unistd.h>"

    system "./configure", "--prefix=#{prefix}"
    system "make", "install"

    # remove Mac fork files...
    rm Dir["data/._*"]
    pkgshare.install "data"
    doc.install "doc/iSGv2_manual.pdf"
  end

  test do
    assert_match "heterogeneity", shell_output("#{bin}/indel-seq-gen -h 2>&1", 0)
  end
end
