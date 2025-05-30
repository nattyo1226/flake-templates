{
    description = "A collection of project templates";

    outputs = { ... }: {
        templates = {
            julia = {
                description = "A minimal julia project";
                path = ./julia;
            };
            typst = {
                description = "A minimal typst project";
                path = ./typst;
            };
        };
    };
}
