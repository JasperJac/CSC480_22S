#!/bin/bash

# Run this script to remove all content from all databases and subdirectories in assignment directory.

docker exec -it cpr-mongo bash -c 'mongosh --port "$MONGO_PORT" -u root -p "$MONGO_INITDB_ROOT_PASSWORD" -- "$MONGO_INITDB_DATABASE" <<EOF
    use cpr;
    db.students.drop();
EOF'

docker exec -it cpr-mongo2 bash -c 'mongosh --port "$MONGO2_PORT" -u root -p "$MONGO_INITDB_ROOT_PASSWORD" -- "$MONGO_INITDB_DATABASE" <<EOF
    use cpr;
    db.professors.drop();
EOF'

docker exec -it cpr-mongo3 bash -c 'mongosh --port "$MONGO3_PORT" -u root -p "$MONGO_INITDB_ROOT_PASSWORD" -- "$MONGO_INITDB_DATABASE" <<EOF
    use cpr;
    db.courses.drop();
EOF'

docker exec -it cpr-mongo4 bash -c 'mongosh --port "$MONGO4_PORT" -u root -p "$MONGO_INITDB_ROOT_PASSWORD" -- "$MONGO_INITDB_DATABASE" <<EOF
    use cpr;
    db.assignments.drop();
    db.submissions.drop();
EOF'

docker exec -it cpr-mongo5 bash -c 'mongosh --port "$MONGO5_PORT" -u root -p "$MONGO_INITDB_ROOT_PASSWORD" -- "$MONGO_INITDB_DATABASE" <<EOF
    use cpr;
    db.teams.drop();
EOF'

docker exec -it cpr-professor-assignment bash -c "rm -rf /opt/ol/wlp/output/defaultServer/assignments/*"