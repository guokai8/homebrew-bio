require 'formula'

class H5utils < Formula
  homepage 'http://ab-initio.mit.edu/wiki/index.php/H5utils'
  url 'http://ab-initio.mit.edu/h5utils/h5utils-1.12.1.tar.gz'
  sha256 '7290290ca5d5d4451d757a70c86baaa70d23a28edb09c951b6b77c22b924a38d'

  depends_on :libpng
  depends_on 'hdf5'

  # A patch is required in order to build h5utils with libpng 1.5
  patch :p0 do
    url "https://trac.macports.org/export/102291/trunk/dports/science/h5utils/files/patch-writepng.c"
    sha1 "026aa59f2e13388d0b7834de6dcbd48da2858cbe"
  end

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--without-octave"
    system "make install"
  end
end
