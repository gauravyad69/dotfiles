{pkgs, ...}:
{
   services.printing = {
     enable = true;
     drivers = with pkgs; [ gutenprint  canon-cups-ufr2 splix ];

   };



    services.system-config-printer.enable = true;
  programs.system-config-printer.enable = true;
}
