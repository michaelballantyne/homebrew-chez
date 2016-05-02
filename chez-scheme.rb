class ChezScheme < Formula
  desc "Chez Scheme is a compiler and run-time system for the language of the Revised^6 Report on Scheme (R6RS), with numerous extensions. The compiler generates native code for each target processor, with support for x86, x86_64, and 32-bit PowerPC architectures."
  homepage "http://www.scheme.com/"
  head "https://github.com/cisco/ChezScheme.git"

  depends_on :x11

  def install
    inreplace "c/scheme.c", "/usr/lib/csv%v/%m:/usr/local/lib/csv%v/%m", "#{prefix}/lib/csv%v/%m"

    system "./configure", "--installprefix=#{prefix}", "--installman=#{man}", "--threads"
    system "make", "install", "InstallSchemeName=chez"
  end

  test do
    system "chez --version"
  end
end
