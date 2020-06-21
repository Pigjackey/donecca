<template>
  <v-app>
    <v-app-bar
      app
      color="primary"
      dark
    >
      <div class="d-flex align-center">
        <h1>
          Donecca
        </h1>
      </div>

      <v-spacer></v-spacer>

      <h3>
        A Love Story Still in Progress
      </h3>
    </v-app-bar>

    <v-content>
      <v-tabs
        v-model="tab"
        background-color="primary darken-1"
        dark
        grow
        centered
      >
        <v-tab>Back Story</v-tab>
        <v-tab>Timeline</v-tab>
        <v-tab>Home</v-tab>
        <v-tab>Looking Forward</v-tab>
        <v-tab>Media</v-tab>
      </v-tabs>
      <v-tabs-items v-model="tab">
        <v-tab-item></v-tab-item>
        <v-tab-item></v-tab-item>
        <v-tab-item>
          <Welcome/>
        </v-tab-item>
        <v-tab-item></v-tab-item>
        <v-tab-item></v-tab-item>
      </v-tabs-items>
    </v-content>
  </v-app>
</template>

<script>
import Welcome from './components/Welcome'

export default {
  name: 'App',

  components: {
    Welcome,
  },
  data: () => ({
    tab: 2
  }),
};
</script>
