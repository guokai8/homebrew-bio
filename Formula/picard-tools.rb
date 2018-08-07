require 'formula'

class PicardTools < Formula
  homepage "http://broadinstitute.github.io/picard/"
  url "https://github.com/broadinstitute/picard/releases/download/1.120/picard-tools-1.120.zip"
  sha256 "9831a6fa4d17eeb20d53e26bfb2b20793732f6693878f7dd7f408aa0f92a1e57"

  def install
    (share/'java').install Dir['*.jar', "picard-tools-#{version}/*.jar"]
  end

  def caveats
    <<-EOS.undent
      The Java JAR files are installed to
          #{HOMEBREW_PREFIX}/share/java
    EOS
  end

  test do
    system "java -jar #{share}/java/ViewSam.jar --version"
  end
end
