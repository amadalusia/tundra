_:
let
  securly = "${builtins.readFile ./certificates/securly_ca_2034.pem}";
in
{
  security.pki.certificates = [
    ''
      securly
      =======================
      ${securly}
    ''
  ];
}
