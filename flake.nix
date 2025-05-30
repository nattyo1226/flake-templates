{
    description = "A collection of project templates";

    outputs = { ... }: {
        templates = {
            typst = {
                description = "A minimal typst project";
                path = ./typst;
            };
        };
    };
}
