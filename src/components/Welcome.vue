<template>
  <v-container>
    <v-row class="text-center">
      <v-col>
        <v-img v-if="!showImage" src="https://cdn.gamer-network.net/2018/usgamer/obi-wan-header.jpg/EG11/thumbnail/1920x1080/format/jpg/quality/65/obi-wan-kenobi-arrives-in-star-wars-battlefront-2-in-november.jpg" contain height="300"/>
        <v-img v-if="showImage" src="https://i.ytimg.com/vi/frszEJb0aOo/maxresdefault.jpg" contain height="300"/>
      </v-col>
    </v-row>
    <v-row class="text-center">
      <v-col>
        <v-btn v-if="!showImage" @click="showImage = true" color="primary">Hello there p</v-btn>
        <v-btn v-if="showImage" @click="showImage = false" color="primary">General Kenobi</v-btn>
      </v-col>
    </v-row>
    <v-row>
      <v-btn href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">Give Collin a new sphincter</v-btn>
    </v-row>
  </v-container>
</template>

<script>
  export default {
    name: 'Welcome',

    data: () => ({
      showImage: false
    }),
  }
</script>
