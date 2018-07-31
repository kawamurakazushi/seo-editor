<template lang="pug">
  div(id="sidebar" class="sidebar")
    .input-wrapper
      a-input-search(placeholder="検索" v-model="search")
      a-icon(type="file-add" @click="add") 
    .files
      a-menu(:defaultSelectedKeys="[0]" :mode="mode" :theme="theme")
        a-menu-item(v-for="(data, index) in articles.filter(a => a.body.includes(search) || a.title.includes(search))")
          div(@click="selectNote(index)")
            a-icon(type="file-text")
            span {{ data.title }}
</template>

<script>
export default {
  name: "sidebar",
  data() {
    return {
      mode: "inline",
      theme: "light",
      search: ""
    };
  },
  props: {
    articles: {
      type: Array,
      required: true
    },
    selectNote: {
      type: Function,
      required: true
    },
    add: {
      type: Function,
      required: true
    }
  }
};
</script>

<style lang="stylus">
.sidebar {
  flex: 1;
  background-color: white;
  border: 1px solid #e8e8e8;

  .input-wrapper {
    display: flex;
    align-items: center;
    padding: 16px;

    i {
      cursor: pointer;
      margin-left: 8px;

      &:hover {
        opacity: 0.7;
      }
    }
  }

  .files {
    overflow-y: auto;

    ul {
      height: 100%;
    }
  }
}

::-webkit-scrollbar {
  width: 8px;
}

::-webkit-scrollbar-track {
  background-color: white;
}

::-webkit-scrollbar-thumb {
  background-color: #6169927a;
  border-radius: 4px;
}
</style>
