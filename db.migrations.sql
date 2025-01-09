
-- ################################
-- #### create all extensions #####
-- ################################

create extension plpython3u;
create extension vector;
create extension ai;

-- #########################################
-- #### create almaden_knowledge table #####
-- #########################################

CREATE TABLE IF NOT EXISTS almaden_knowledge(
    id SERIAL PRIMARY KEY,
    problem VARCHAR(256),
    solution TEXT,
    created_at TIMESTAMPTZ NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL
);

-- VECTORIZING TASK --
SELECT ai.create_vectorizer(
   'almaden_knowledge'::regclass,
   destination => 'almaden_knowledge_embedding',
   embedding => ai.embedding_openai('text-embedding-3-small', 768),
   chunking => ai.chunking_recursive_character_text_splitter('problem')
);

-- ###########################################
-- #### create customers_knowledge table #####
-- ###########################################

CREATE TABLE IF NOT EXISTS customers_knowledge(
    customer_id VARCHAR(32) PRIMARY KEY,
    problem VARCHAR(256),
    solution TEXT,
    created_at TIMESTAMPTZ NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL
);

-- VECTORIZING TASK --
SELECT ai.create_vectorizer(
   'customers_knowledge'::regclass,
   destination => 'customers_knowledge_embedding',
   embedding => ai.embedding_openai('text-embedding-3-small', 768),
   chunking => ai.chunking_recursive_character_text_splitter('problem')
);
