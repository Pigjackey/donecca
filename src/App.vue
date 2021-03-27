<template>
  <v-app id="app">
    <v-app-bar
      app
      color="red"
      dark
    >
      <div class="d-flex align-center">
        <h1 @click="tab = 2">
          Donecca
        </h1>
      </div>

      <v-spacer></v-spacer>

      <h3>
        A Love Story Still in Progress
      </h3>
    </v-app-bar>

    <v-main>
      <v-tabs
        v-model="tab"
        background-color="red darken-1"
        dark
        grow
        centered
      >
        <v-tab>Becca Journal</v-tab>
        <v-tab>Timeline</v-tab>
        <v-tab>Home</v-tab>
        <v-tab>Looking Forward</v-tab>
        <v-tab>Media</v-tab>
      </v-tabs>
      <v-tabs-items v-model="tab">
        <v-tab-item>
          <Journal :show-journal="authorized"/>
        </v-tab-item>
        <v-tab-item>
          <Timeline/>
        </v-tab-item>
        <v-tab-item>
          <Welcome @validPassword="authorized = true" />
        </v-tab-item>
        <v-tab-item></v-tab-item>
        <v-tab-item>
          <Media/>
        </v-tab-item>
      </v-tabs-items>
    </v-main>
  </v-app>
</template>

<script>
import Journal from '@/components/Journal'
import Timeline from '@/components/Timeline'
import Welcome from '@/components/Welcome'
import Media from '@/components/Media'

export default {
  name: 'App',

  components: {
    Journal,
    Timeline,
    Welcome,
    Media
  },
  data: () => ({
    tab: 2,
    authorized: false
  })
};
</script>