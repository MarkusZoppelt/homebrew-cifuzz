class Cifuzz < Formula
  desc "CLI that helps you to integrate and run fuzzing based tests"
  homepage "https://docs.code-intelligence.com/ci-fuzz"
  url "https://github.com/CodeIntelligenceTesting/cifuzz/archive/refs/tags/v0.26.0.tar.gz"
  sha256 "6916faf2fd66f7a2c0ca67bb610ab21161b877e0ac3af70f7e3f127fcb074ea8"
  license "Apache-2.0"
  head "https://github.com/CodeIntelligenceTesting/cifuzz.git"

  depends_on "go" => :build

  def install
    system "go", "run", "tools/builder/builder.go", "--version", "0.26.0"
    system "go", "run", "-tags", "installer", "cmd/installer/installer.go", "--install-dir", prefix.to_s
  end

  test do
    system "#{bin}/cifuzz", "--version"
  end
end
