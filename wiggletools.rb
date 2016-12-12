class Wiggletools < Formula
  desc "Compute genome-wide statistics with composable iterators"
  homepage "https://github.com/Ensembl/WiggleTools"
  url "https://github.com/Ensembl/WiggleTools/archive/v1.2.1.tar.gz"
  sha256 "906d32e281fe234b3eacbe569c21e68d61aca3d0ef2eec501e4efd61799be4ee"

  depends_on "htslib"
  depends_on "libbigwig"
  depends_on "gsl"

  def install
    system "make"
    cp_r "test", prefix
    cp_r "bin", prefix
    cp "Makefile", prefix
  end

  test do
    cp_r prefix/"test", testpath
    cp_r prefix/"bin", testpath
    cp prefix/"Makefile", testpath
    system "make", "test"
  end
end
