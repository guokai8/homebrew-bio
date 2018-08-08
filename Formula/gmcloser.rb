require "formula"

class Gmcloser < Formula
  homepage "http://sourceforge.net/projects/gmcloser/"
  url "https://ayera.dl.sourceforge.net/project/gmcloser/GMcloser-1.6.2.tar.gz"
  sha256 "b5f43cf411b92aaba76e90ab82acbd50c491a95f15ade088fbbb97f593281cc6"

  bottle :unneeded
    def install
      bin.install "gmcloser"
      bin.install "gmvalue"
      bin.install "gmcloser-blast-LR-MT.pl"
      bin.install "gmcloser-blast.pl"
      bin.install "gmcloser-nucmer.pl"
      bin.install "Nucmer_contig_align.pl"
      bin.install "connect_subcontigs_GMcloser2.pl"
      bin.install "coval-filter-short.pl"
    end

  test do
    system "#{bin}/gmcloser --help"
  end
end
