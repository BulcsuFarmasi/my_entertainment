

class GeneralRoutePath {
    bool isHome = false;
    bool isBooks = false;
    bool isFilms = false;
    bool isSeries = false;

    GeneralRoutePath();

    GeneralRoutePath.home(): isHome = true;
    GeneralRoutePath.books(): isBooks = true;
    GeneralRoutePath.films(): isFilms = true;
    GeneralRoutePath.series(): isSeries = true;
}