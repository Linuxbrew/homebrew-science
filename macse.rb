# macse: Build a bottle for Linuxbrew
class Macse < Formula
  desc "Multiple Alignment of Coding SEquences"
  homepage "http://bioweb.supagro.inra.fr/macse/"
  url "http://bioweb.supagro.inra.fr/macse/releases/macse_v1.2.jar"
  sha256 "5545afd948cc4cd8af435ad9b29c78f77226b73c505b4a42cf938aad0d256803"
  # doi "10.1371/journal.pone.0022594"
  # tag "bioinformatics"

  bottle do
    cellar :any_skip_relocation
    sha256 "50827604861e1cf0430523cccadd6ecc8ae7ba4039a8134eef96f25d278c064a" => :el_capitan
    sha256 "4a0c78063fc626c24a2e74a6e65970cf77e3243da3c49a6a1b24c0a08daad585" => :yosemite
    sha256 "4a0c78063fc626c24a2e74a6e65970cf77e3243da3c49a6a1b24c0a08daad585" => :mavericks
  end

  depends_on :java

  def install
    opts = "-mx4000m -ms80m"
    jar = "macse_v#{version}.jar"
    prefix.install jar
    bin.write_jar_script prefix/jar, "macse", opts
  end

  test do
    assert_match "Thraustochytrium", shell_output("#{bin}/macse", 1)
  end
end
