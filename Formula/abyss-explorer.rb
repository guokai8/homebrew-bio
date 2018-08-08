class AbyssExplorer < Formula
  desc "Visualize genome sequence assemblies"
  homepage "http://www.bcgsc.ca/platform/bioinfo/software/abyss-explorer"
  # doi "10.1109/TVCG.2009.116"
  # tag "bioinformatics"

  url "http://www.bcgsc.ca/downloads/abyss-explorer/abyss-explorer-1.3.4/abyss-explorer-1.3.4.zip"
  sha256 "fa4197c985ae9e66a01b4d3db4e6211f4e84444bc31deaf4c1aa352431ae6491"
  revision 1

  bottle :unneeded

  def install
    libexec.install "AbyssExplorer.jar", "lib"
    (bin / "abyss-explorer").write <<~EOS
      #!/bin/sh
      set -eu
      exec java -jar #{libexec}/AbyssExplorer.jar "$@"
    EOS
  end

  test do
    system "abyss-explorer", "--version"
  end
end
