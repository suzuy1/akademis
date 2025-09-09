<template>
  <div>
    <h1>Lecturers</h1>
    <NuxtLink to="/lecturers/create">Add Lecturer</NuxtLink>
    <table>
      <thead>
        <tr>
          <th>NIP</th>
          <th>Name</th>
          <th>Departemen</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="lecturer in lecturers" :key="lecturer.id">
          <td>{{ lecturer.nip }}</td>
          <td>{{ lecturer.name }}</td>
          <td>{{ lecturer.departemen }}</td>
          <td>
            <NuxtLink :to="`/lecturers/edit/${lecturer.id}`">Edit</NuxtLink>
            <button @click="deleteLecturer(lecturer.id)">Delete</button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script setup>
const supabase = useSupabaseClient()
const lecturers = ref([])

const getLecturers = async () => {
  const { data, error } = await supabase.from('lecturers').select('*')
  if (error) {
    console.error(error)
  } else {
    lecturers.value = data
  }
}

const deleteLecturer = async (id) => {
  const { error } = await supabase.from('lecturers').delete().eq('id', id)
  if (error) {
    console.error(error)
  } else {
    // Refresh the list of lecturers
    getLecturers()
  }
}

getLecturers()
</script>
