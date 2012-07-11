task :cane do
  Cane.run(abc: {files: "app/**/*.rb", max: 15}, style: {files: "app/**/*.rb", measure: 160}, threshold: [], max_violations: 0)
end