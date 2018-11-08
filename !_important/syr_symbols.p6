for 0x0700 .. 0x074F {
  say "symbol: <{$_.chr}>";
  say "codepoint: ", .base(16);
  .uniname.say;
  say '-' x 30;
}
