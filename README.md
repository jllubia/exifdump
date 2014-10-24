exifdump
========

Mac OS X Command Line Tool To Dump Image Information.

Usage:
`exifdump filename [filename2]..[filenameN]`

Sample command:
`exifdump IMG_3292.jpg`

Sample output:
```
File: IMG_3292.jpg
UTI: public.jpeg
Metadata: {
    ColorModel = RGB;
    DPIHeight = 72;
    DPIWidth = 72;
    Depth = 8;
    PixelHeight = 960;
    PixelWidth = 1280;
    ProfileName = "sRGB IEC61966-2.1";
    "{Exif}" =     {
        ApertureValue = "2.275007044237813";
        BrightnessValue = "10.13685239491691";
        ColorSpace = 1;
        DateTimeDigitized = "2013:06:04 19:44:49";
        DateTimeOriginal = "0000:00:00 19:44:49";
        ExifVersion =         (
            2,
            3
        );
        ExposureMode = 0;
        ExposureProgram = 2;
        ExposureTime = "0.0003703703703703704";
        FNumber = "2.2";
        Flash = 16;
        FocalLenIn35mmFilm = 33;
        FocalLength = "4.2";
        ISOSpeedRatings =         (
            50
        );
        LensMake = Apple;
        MeteringMode = 3;
        PixelXDimension = 1280;
        PixelYDimension = 960;
        SceneCaptureType = 0;
        SceneType = 0;
        SensingMethod = 2;
        ShutterSpeedValue = "11.39874411302983";
        SubjectArea =         (
            993,
            878,
            610,
            612
        );
        WhiteBalance = 0;
    };
    "{GPS}" =     {
        DateStamp = "0000:00:00";
        Latitude = "21.0165";
        LatitudeRef = N;
        Longitude = "156.5765";
        LongitudeRef = W;
        TimeStamp = "19:44:48";
    };
    "{IPTC}" =     {
        City = Wailuku;
        "Country/PrimaryLocationName" = "United States";
        DateCreated = 00000000;
        DigitalCreationDate = 20130604;
        DigitalCreationTime = 194449;
        "Province/State" = Hawaii;
        TimeCreated = 194449;
    };
    "{JFIF}" =     {
        DensityUnit = 1;
        JFIFVersion =         (
            1,
            0,
            1
        );
        XDensity = 72;
        YDensity = 72;
    };
    "{TIFF}" =     {
        DateTime = "2014:10:22 11:44:31";
        Make = Apple;
        Model = "iPhone 6";
        ResolutionUnit = 2;
        Software = "Adobe Photoshop Lightroom 5.0 (Macintosh)";
        XResolution = 72;
        YResolution = 72;
    };
}
```
