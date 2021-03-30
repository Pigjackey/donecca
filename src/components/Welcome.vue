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
        <v-btn v-if="!showImage" @click="showImage = true" color="primary">Hello there</v-btn>
        <v-btn v-if="showImage" @click="showImage = false" color="primary">General Kenobi</v-btn>
      </v-col>
    </v-row>
    <v-row class="text-center">
      <v-col>
        <v-btn href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">Give Collin a new sphincter</v-btn>
      </v-col>
    </v-row>
    <v-row class="text-center">
      <v-col>
        <v-btn href="https://www.youtube.com/watch?v=na3U9Uvpz7g&list=FLo0--ByOp3JlKSfzQUEbgPw&index=5">Lettie push this button</v-btn>
      </v-col>
    </v-row>
    <v-row v-if="password !== 'Becca'" justify="center">
      <v-col cols="6">
        <v-card>
          <v-card-title class="justify-center">
            Please Enter Your Password to Unlock Full Page:
          </v-card-title>
          <v-card-text>
            <v-text-field v-model="password" solo></v-text-field>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
    <v-row v-else justify="center">
      <v-col cols="6">
        <v-card>
          <v-card-title class="justify-center">
            Authenticated!
          </v-card-title>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
  export default {
    name: 'Welcome',

    data: () => ({
      showImage: false,
      password: ''
    }),

    watch: {
      password: function() {
        if (this.password === 'Becca') {
          this.$emit('validPassword')
        }
      }
    }
  }
</script>
