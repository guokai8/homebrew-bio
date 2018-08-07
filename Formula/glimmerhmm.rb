require "formula"

class Glimmerhmm < Formula
  homepage "http://ccb.jhu.edu/software/glimmerhmm/"
  #doi "10.1093/bioinformatics/bth315"
  url "ftp://ccb.jhu.edu/pub/software/glimmerhmm/GlimmerHMM-3.0.2.tar.gz"
  sha256 "7a9c442dc0cbdb001ed55fc29e1f1283502bdff4db596803ffcac8965d66f7dc"

  def install
    # fatal error: 'malloc.h' file not found
    inreplace %w[sources/oc1.h sources/util.c train/utils.c], "malloc.h", "stdlib.h"

    system *%w[make -C sources]
    system *%w[make -C train]
    bin.install %w[sources/glimmerhmm bin/glimmhmm.pl]
    prefix.install Dir["*"] - %w[bin sources]
  end

  test do
    system "#{bin}/glimmerhmm -h"
  end
end
