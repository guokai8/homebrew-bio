require "formula"

class Platanus < Formula
  homepage "http://platanus.bio.titech.ac.jp/platanus-assembler/"
  #doi "10.1101/gr.170720.113"

  version "1.2.1"
  url "http://platanus.bio.titech.ac.jp/Platanus_release/20130901010201/platanus"
  sha256 "305368ecd91da8c5c0e18569aa58538b0cca99cf3e7360ad9b116db74a37b8ad"


  depends_on "gcc" if OS.mac?

  def install
    if OS.mac?
      mv "platanus.macOSX", "platanus"

      # Fix the dependent shared library install names.
      gccformula = Formula["gcc"]
      gcc = gccformula.opt_lib/"gcc/x86_64-apple-darwin13.2.0"/gccformula.version
      system "install_name_tool -change /opt/local/lib/libstdc++.6.dylib #{gcc}/libstdc++.6.dylib platanus"
      system "install_name_tool -change /opt/local/lib/gcc48/libgomp.1.dylib #{gcc}/libgomp.1.dylib platanus"
      system "install_name_tool -change /opt/local/lib/gcc48/libgcc_s.1.dylib #{gcc}/libgcc_s.1.dylib platanus"
    end
    bin.install "platanus"
  end

  test do
    system "#{bin}/platanus 2>&1 |grep platanus"
  end
end
