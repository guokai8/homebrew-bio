class Cufflinks < Formula
  desc "Transcriptome assembly, differential expression analysis for RNA-Seq"
  homepage "https://cole-trapnell-lab.github.io/cufflinks/"
   if OS.linux?
        url "http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.2.1.Linux_x86_64.tar.gz"
        sha256 "39f812452cae26462e5d2671d38104d9e8ef30aaf9ab6dea8ca57f50f46448e4"
    else
        url "http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.2.1.OSX_x86_64.tar.gz"
        sha256 "98a78cdf9e38783f9809d74faadc70654977d5f6120e262ef623a04840da00c6"
    end
  bottle :unneeded

  def install
      bin.install "gtf_to_sam"
      bin.install "cuffcompare"
      bin.install "cuffdiff"
      bin.install "cufflinks"
      bin.install "cuffmerge"
      bin.install "cuffnorm"
      bin.install "gffread"
      bin.install "cuffquant"
  end

  test do
    system "#{bin}/cuffdiff 2>&1 |grep -q cuffdiff"
  end
end
