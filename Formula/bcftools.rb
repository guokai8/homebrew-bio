require "formula"

class Bcftools < Formula
  homepage "https://github.com/samtools/bcftools"
  url "https://github.com/samtools/bcftools/archive/1.9.tar.gz"
  sha256 "223b90c9a9b11576174384de70abe8e8394aef1b45c7324e4bf875d0f344e96e"
  head "https://github.com/samtools/bcftools.git"

  depends_on "htslib"

  def install
    inreplace "Makefile", "include $(HTSDIR)/htslib.mk", ""
    htslib = Formula["htslib"].opt_prefix
    # Write version to avoid 0.0.1 version information output from Makefile
    system "echo '#define BCFTOOLS_VERSION \"#{version}\"' > version.h"
    system *%W[make bcftools HTSDIR=#{htslib}/include HTSLIB=#{htslib}/lib/libhts.a]
    system *%W[make install prefix=#{prefix} HTSDIR=#{htslib}/include HTSLIB=#{htslib}/lib/libhts.a]
  end

  test do
    system "#{bin}/bcftools 2>&1 |grep -q bcftools"
  end
end
