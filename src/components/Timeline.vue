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
        <template v-slot:icon>
          <v-icon @click="item.showOther = !item.showOther" dark>{{ item.icon }}</v-icon>
        </template>
        <template v-if="item.showOther" v-slot:opposite>
          <span
            :class="`headline font-weight-bold ${item.color}--text`"
            v-text="item.date"
          ></span>
        </template>
        <v-card
          v-if="item.showOther"
          :color="item.color"
          dark
        >
          <v-card-title class="title">{{ item.title }}</v-card-title>
          <v-card-text class="white text--primary">
            <p class="pt-2">{{ item.text }}</p>
            <v-btn
              :color="item.color"
              class="mx-0"
              outlined
            >
              Picture
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
          icon: 'mdi-face',
          title: 'First Meeting',
          text: 'The day Becca and Donovon first met! It was a cold day and Donovon was looking forward to meeting some new girls at the ice skating rink. Little did he know that when he knocked on Becca\'s door, that nothing would ever be the same',
          date: '4 October 2019',
          showOther: false
        },
        {
          color: 'purple',
          icon: 'mdi-book-variant',
          title: 'First Meeting',
          text: 'This was the day Becca and I first met each other',
          date: '1 June 2020',
          showOther: false
        },
        {
          color: 'green',
          icon: 'mdi-airballoon',
          title: 'First Meeting',
          text: 'This was the day Becca and I first met each other',
          date: '1 June 2020',
          showOther: false
        },
        {
          color: 'indigo',
          icon: 'mdi-buffer',
          title: 'First Meeting',
          text: 'This was the day Becca and I first met each other',
          date: '1 June 2020',
          showOther: false
        },
      ]
    })
  }
</script>
