<template>
  <v-container>
    <v-timeline align-top :dense="$vuetify.breakpoint.smAndDown">
      <v-timeline-item
        v-for="(item, i) in items"
        :key="i"
        :color="item.color"
        :icon="item.icon"
        fill-dot
      >
        <template v-slot:opposite>
          <span
            :class="`headline font-weight-bold ${item.color}--text`"
            v-text="item.date"
          ></span>
        </template>
        <v-card
          :color="item.color"
          dark
        >
          <v-card-title class="title">Lorem Ipsum Dolor</v-card-title>
          <v-card-text class="white text--primary">
            <p>Lorem ipsum dolor sit amet, no nam oblique veritus. Commune scaevola imperdiet nec ut, sed euismod convenire principes at. Est et nobis iisque percipit, an vim zril disputando voluptatibus, vix an salutandi sententiae.</p>
            <v-btn
              :color="item.color"
              class="mx-0"
              outlined
            >
              Button
            </v-btn>
          </v-card-text>
        </v-card>
      </v-timeline-item>
    </v-timeline>
  </v-container>
</template>

<script>
  export default {
    name: 'Timeline',

    data: () => ({
      items: [
        {
          color: 'red',
          icon: 'mdi-star',
          date: '1 June 2020'
        },
        {
          color: 'purple',
          icon: 'mdi-book-variant',
          date: '1 June 2020'
        },
        {
          color: 'green',
          icon: 'mdi-airballoon',
          date: '1 June 2020'
        },
        {
          color: 'indigo',
          icon: 'mdi-buffer',
          date: '1 June 2020'
        },
      ]
    })
  }
</script>
