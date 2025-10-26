{ 
    stdenv,
    fetchurl,
    cmake,
    gfortran,
    openmpi,
    blas,
    lapack,
}:

stdenv.mkDerivation {
    pname = "HPhi";
    version = "3.5.2";

    src = fetchurl {
        url = "https://github.com/issp-center-dev/HPhi/releases/download/v3.5.2/HPhi-3.5.2.tar.gz";
        sha256 = "sha256-gH/36qrfRCyRNzB18Lp07dH5nC3Ev0FieQAhZU4K6sU=";
    };

    nativeBuildInputs = [ cmake ];
    buildInputs = [ gfortran openmpi blas lapack ];
}