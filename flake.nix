{
    description = "A collection of project templates";

    outputs = { ... }: {
        templates = {
            hphi = {
                description = "A minimal hphi project";
                path = ./hphi;
            };
            julia = {
                description = "A minimal julia project";
                path = ./julia;
            };
            rust = {
                description = "A minimal rust project";
                path = ./rust;
            };
            latex = {
                description = "A minimal LaTeX project";
                path = ./latex;
            };
            lean = {
                description = "A minimal lean 4 project";
                path = ./lean4;
            };
            python = {
                description = "A minimal python project with uv";
                path = ./python;
            };
            typst = {
                description = "A minimal typst project";
                path = ./typst;
            };
        };
    };
}
