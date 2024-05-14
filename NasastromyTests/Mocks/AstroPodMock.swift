//
//  AstroPodMock.swift
//  NasastromyTests
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

import Foundation

enum AstroPodMock {
    case sample
    
    private var value: String {
        switch self {
        case .sample:
            """
            [
              {
                "date": "2024-05-05",
                "explanation": "What happens to a star that goes near a black hole? If the star directly impacts a massive black hole, then the star falls in completely -- and everything vanishes. More likely, though, the star goes close enough to have the black hole's gravity pull away its outer layers, or disrupt, the star. Then, most of the star's gas does not fall into the black hole.  These stellar tidal disruption events can be as bright as a supernova, and an increasing amount of them are being discovered by automated sky surveys. In the featured artist's illustration, a star has just passed a massive black hole and sheds gas that continues to orbit.  The inner edge of a disk of gas and dust surrounding the black hole is heated by the disruption event and may glow long after the star  is gone.    Hole New Worlds: It's Black Hole Week at NASA!",
                "hdurl": "https://apod.nasa.gov/apod/image/2405/BhShredder_NASA_3482.jpg",
                "media_type": "image",
                "service_version": "v1",
                "title": "A Black Hole Disrupts a Passing Star",
                "url": "https://apod.nasa.gov/apod/image/2405/BhShredder_NASA_1080.jpg"
              },
              {
                "copyright": "\nReinhold Wittich;\nMusic: Sunrise from \nAlso sprach Zarathusra \n(R. Strauss) \nby Sascha Ende\n",
                "date": "2024-05-06",
                "explanation": "This is how the Sun disappeared from the daytime sky last month. The featured time-lapse video was created from stills taken from Mountain View, Arkansas, USA on 2024 April 8. First, a small sliver of a normally spotted Sun went strangely dark. Within a few minutes, much of the background Sun was hidden behind the advancing foreground Moon. Within an hour, the only rays from the Sun passing the Moon appeared like a diamond ring. During totality, most of the surrounding sky went dark, making the bright pink prominences around the Sun's edge stand out, and making the amazing corona appear to spread into the surrounding sky.  The central view of the corona shows an accumulation of frames taken during complete totality. As the video ends, just a few minutes later, another diamond ring appeared -- this time on the other side of the Moon. Within the next hour, the sky returned to normal.   Celebrate the Voids: It's Black Hole Week at NASA!",
                "media_type": "video",
                "service_version": "v1",
                "title": "A Total Solar Eclipse from Sliver to Ring",
                "url": "https://www.youtube.com/embed/28gtfSziCgU?rel=0"
              }
            ]
            """
        }
    }
    
    var data: Data {
        return Data(self.value.utf8)
    }
}
