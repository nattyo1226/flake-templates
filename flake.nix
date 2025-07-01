{
    description = "A collection of project templates";

    outputs = { ... }: {
        templates = {
            julia = {
                description = "A minimal julia project";
                path = ./julia;
            };
            rust = {
                description = "A minimal rust project";
                path = ./rust;
            };
            python = {
                description = "A minimal python project with uv";
                path = ./python;
            };
            typst = {
                description = "A minimal typst project";
                path = ./typst;
            };
            hphi = {
                description = "A minimal hphi project";
                path = ./hphi;
            }
        };
    };
}
