class Mruby < Formula
  desc "Lightweight implementation of the Ruby language"
  homepage "https://mruby.org/"
  url "https://github.com/mruby/mruby/archive/1.4.1.tar.gz"
  sha256 "2469b1f3e3c97a34f8c3dca1bca9795f66d6b17c7be60ddfc1f3b502cdcbb400"

  head "https://github.com/mruby/mruby.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "6a797e39d7d3d5f3388f782ae3db8fa0263826b7086b97a87d75750bb64edbf1" => :high_sierra
    sha256 "5b89b75993d27718e8264a5573ad756dec34309b4be0fcfbb4656e66218d00c6" => :sierra
    sha256 "e5c6e6865de4674cbe8f3c9de021f096a6e2d5cf3c3e8953de5e6b8dcaf81678" => :el_capitan
  end

  depends_on "bison" => :build

  def install
    system "make"

    cd "build/host/" do
      lib.install Dir["lib/*.a"]
      prefix.install %w[bin mrbgems mrblib]
    end

    prefix.install "include"
  end

  test do
    system "#{bin}/mruby", "-e", "true"
  end
end
