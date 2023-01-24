# Unity-Terrain-Shadergraph

A simple procedural terrain shadergraph for unity's inbuilt terrain system  created with Unity URP 2022.2.2f1

Tested with Unity URP 2022.2

Will only work in newer versions of unity that have enabled shadergraphs for unity terrain, may work in earlier versions on standard mesh terrains.

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
  - Seemlessly transitions between distance and detail normals based on camera distance
  - Smoothness, Metallic, and Color settings for each texture
  - Doesn't need splatmaps, great for procedural terrain

Desert Distance
![Desert_Distance](https://user-images.githubusercontent.com/67586167/214444915-bb697dc7-62b4-40c1-9159-a69c40e6fcad.jpg)

Desert Detail
![Desert_Detail](https://user-images.githubusercontent.com/67586167/214444958-3a44e7a5-f501-49c9-8416-74bbd50c322e.jpg)

Grasslands Distance
![Grasslands_Distance](https://user-images.githubusercontent.com/67586167/214445005-8e6faa5f-0b4b-4651-8333-cfe348a48a8a.jpg)

Grasslands Detail
![Grasslands_Detail](https://user-images.githubusercontent.com/67586167/214445041-404684f9-6ba8-44f8-a291-1dde3a302022.jpg)

Ice Distance
![Ice_Distance](https://user-images.githubusercontent.com/67586167/214445065-799eea04-01db-4d2b-a540-7f9d4da4b700.jpg)

Ice Detail
![Ice_Detail](https://user-images.githubusercontent.com/67586167/214445102-b2b0eb54-0db0-4bd5-97e3-cc36fe7c6e61.jpg)

Inspector
![Inspector](https://user-images.githubusercontent.com/67586167/214447555-ddb507dd-9050-44ec-bd06-8dfadee7bf63.jpg) 

How to use
  1. Add the shader and sub-shaders to your project 
  2. Create a new terrain
  3. Create a material 
  4. Set material shader to Terrain Shadergraph (Shader Graphs -> Terrrain Shadergraph)
  5. Add the material to the terrain settings in the inspector
  6. Add your textures in the material inspector
  
 Some hints and tips 
    - The texture height is set relative the terrain texture height i.e. if your terrain is set 600 height all your texture heights will be lower than this.
    - Normals for distance textures need to be A LOT HIGHER than detail textures, a detail texture normal will normal be between 1-5 but distance texture will be between 2000-3000
    - For height textures (shore/sea, ground, mountain, peak) the scaling is as you would expect. For detail textures 2000 means that the texture will be tiled 2000 times across the terrain, whereas 1 for distance textures means that the texture will stretch to cover the whole terrain, BUT because of Tri-Planar cliff scaling is inverted so you will be typing in values like 0.005 or 0.1. 

I have included a bunch of examples in the 'Examples' folder. This folder is not essential and can be deleted.
