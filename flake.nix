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
            typst = {
                description = "A minimal typst project";
                path = ./typst;
            };
        };
    };
}
