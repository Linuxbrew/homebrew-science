class Libbigwig < Formula
  desc "C library for handling bigWig files"
  homepage "https://github.com/dpryan79/libBigWig"
  url "https://github.com/dpryan79/libBigWig/archive/0.3.0.tar.gz"
  sha256 "221002fe249e8099009f0790f44bfe991e85cb23763cf5fc494e745c0160edc2"

  depends_on "curl"

  def install
    system "make", "install", "prefix=#{prefix}"
    cp_r "test", prefix
    cp "Makefile", prefix
    cp Dir.glob("*.o"), prefix
    cp Dir.glob("*.pico"), prefix
  end

  test do
    cp_r prefix/"test", testpath
    cp prefix/"Makefile", testpath
    cp Dir.glob(prefix/"*.o"), testpath
    cp Dir.glob(prefix/"*.pico"), testpath
    system "make", "test"
  end
end
