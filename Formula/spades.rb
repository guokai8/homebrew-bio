require 'formula'

class Spades < Formula
  homepage "http://bioinf.spbau.ru/spades/"
  #tag "bioinformatics"
  #doi "10.1089/cmb.2012.0021"
  url "http://spades.bioinf.spbau.ru/release3.1.1/SPAdes-3.1.1.tar.gz"
  sha256 "ea5e4961c72813740d3293e330636a0627867ace65bc2a38fc425de24bc62d47"

  depends_on 'cmake' => :build

  def install
    mkdir 'src/build' do
      system 'cmake', '..', *std_cmake_args
      system 'make', 'install'
    end
  end

  test do
    system 'spades.py --test'
  end
end
