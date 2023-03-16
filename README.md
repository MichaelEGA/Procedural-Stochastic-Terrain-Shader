# Procedural Stochastic Terrain Shader

A simple procedural terrain shadergraph for Unity's inbuilt terrain system

Get it here: https://github.com/michael-evan-allison/Procedural-Stochastic-Terrain-Shader

Tested In: Unity URP 2022.2.2f1, Unity URP 2022.2.9f1

Version History
  - 01/02/2023 - Stochastic now seemlessly textures across neighbour terrains
  - 31/01/2023 - Added stochastic node option
  - 25/01/2023 - Initial commit

Features
  - Detail and Distance textures
  - Five detail textures (shore/sea, ground, mountain, peak, cliff)
  - Five distance textures (shore/sea, ground, mountain, peak, cliff)
  - Automatically transitions between textures according to height (shore/sea, ground, mountain, peak) and angle (cliff)
  - Tri-Planar for cliffs (to prevent texture warping)
  - Two different blend modes between detail and distance textures:
      1. Overlay blend (combines distance and detail textures together)
      2. Transition (seemlessly transitions between distance and detail textures according to camera distance)
  - Automatic generation of normal maps (it's a bit hacky but it works)
  - Smoothness, Metallic, Normal and Color settings for each individual texture
  - Seemlessly transitions between normal, smoothness, and metallic settings based on camera distance
  - Use noise to variegate ground layer between ground texture and mountain texture
  - Doesn't need splatmaps, great for procedural terrain
  - Optional stochastic (antitiling) option (now tiles seemlessly across neighbour terrains)

Distance
![Desert_Distance](https://user-images.githubusercontent.com/67586167/214444915-bb697dc7-62b4-40c1-9159-a69c40e6fcad.jpg)

Detail
![Desert_Detail](https://user-images.githubusercontent.com/67586167/214444958-3a44e7a5-f501-49c9-8416-74bbd50c322e.jpg)

Distance
![Grasslands_Distance](https://user-images.githubusercontent.com/67586167/214445005-8e6faa5f-0b4b-4651-8333-cfe348a48a8a.jpg)

Detail
![Grasslands_Detail](https://user-images.githubusercontent.com/67586167/214445041-404684f9-6ba8-44f8-a291-1dde3a302022.jpg)

Distance
![Ice_Distance](https://user-images.githubusercontent.com/67586167/214445065-799eea04-01db-4d2b-a540-7f9d4da4b700.jpg)

Detail
![Ice_Detail](https://user-images.githubusercontent.com/67586167/214445102-b2b0eb54-0db0-4bd5-97e3-cc36fe7c6e61.jpg)

Stochastic Off
![StochasticOff](https://user-images.githubusercontent.com/67586167/215687950-4329abc6-bfb1-4dbe-a5e5-2b1eade22a30.jpg)

Stochastic On
![StochasticOn](https://user-images.githubusercontent.com/67586167/215688021-6817aa60-56d1-45c9-b014-9d2ee4412f84.jpg)

![Inspector](https://user-images.githubusercontent.com/67586167/214447555-ddb507dd-9050-44ec-bd06-8dfadee7bf63.jpg) 

How To Use
  1. Add the shader and sub-shaders to your project 
  2. Create a new terrain
  3. Create a material 
  4. Set material shader to Terrain Shadergraph (Shader Graphs -> Terrrain Shadergraph)
  5. Add the material to the terrain settings in the inspector
  6. Add your textures in the material inspector
  
Some Hints and Tips 
  - The texture height is set relative the terrain texture height i.e. if your terrain is set 600 height all your texture heights will be lower than this.
  - Normals for distance textures need to be A LOT HIGHER than detail textures, a detail texture normal will normal be between 1-5 but distance texture will be between 2000-3000
  - For height textures (shore/sea, ground, mountain, peak) the scaling is as you would expect. For detail textures 2000 means that the texture will be tiled 2000 times across the terrain, whereas 1 for distance textures means that the texture will stretch to cover the whole terrain, BUT because of Tri-Planar cliff scaling is inverted so you will be typing in values like 0.005 or 0.1. 

I have included a bunch of examples in the 'Examples' folder. This folder is not essential and can be deleted.

Credits
  - I used some custom height blending code by GrrrimReapz on Reddit: https://www.reddit.com/r/Unity3D/comments/pr6sld/height_blending_materials_in_shadergraph/
  - I implemented some of Snubber's ideas from his video on youtube: https://www.youtube.com/watch?v=uJSxqr3a0cA&ab_channel=Snubber
  - I implemented Junior_Djjr stochastic node, which can be found here: https://github.com/JuniorDjjr/UnityProceduralStochasticTexturingNode
  - Textures in example files from textures.com
  
  Licensed under Apache 2.0
