require 'formula'

class Libmatio < Formula
  homepage 'http://matio.sourceforge.net'
  url 'https://downloads.sourceforge.net/project/matio/matio/1.5.2/matio-1.5.2.tar.gz'
  sha256 'db02d0fb3373c3d766a606309b17e64a5d8da55610e921a9f1a0ec171e911d45'

  option :universal
  option 'with-hdf5', 'Enable support for newer MAT files that use the HDF5-format'

  depends_on 'hdf5' => :optional

  def install
    ENV.universal_binary if build.universal?
    args = %W[
      --prefix=#{prefix}
      --with-zlib=/usr
      --enable-extended-sparse=yes
    ]

    if build.with? 'hdf5'
      args << "--with-hdf5=#{HOMEBREW_PREFIX}" << "--enable-mat73=yes"
    else
      args << "--with-hdf5=no"
    end

    system "./configure", *args
    system "make"
    system "make install"
  end
end
