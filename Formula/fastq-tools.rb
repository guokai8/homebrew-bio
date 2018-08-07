require "formula"

class FastqTools < Formula
  homepage "http://homes.cs.washington.edu/~dcjones/fastq-tools/"
  url "https://homes.cs.washington.edu/~dcjones/fastq-tools/fastq-tools-0.6.tar.gz"
  sha256 "e671751b3bb776daefa017757b540f8ef14b5d8b00f90b97cbfac1146178c687"

  depends_on "pcre" => :build

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  test do
    system "#{bin}/fastq-grep", "--version"
  end
end
