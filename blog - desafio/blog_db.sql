PGDMP     .    $        
        z           blog    14.1    14.1     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    32768    blog    DATABASE     h   CREATE DATABASE blog WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE blog;
                postgres    false                        0    0    DATABASE blog    COMMENT     6   COMMENT ON DATABASE blog IS 'Desafio numero tres DL';
                   postgres    false    3327            ?            1259    32786 
   comentario    TABLE     ?   CREATE TABLE public.comentario (
    id integer NOT NULL,
    usuario_id integer,
    post_id integer,
    texto text,
    fecha date
);
    DROP TABLE public.comentario;
       public         heap    postgres    false            ?            1259    32774    post    TABLE     o   CREATE TABLE public.post (
    id integer NOT NULL,
    usuario_id integer,
    titulo text,
    fecha date
);
    DROP TABLE public.post;
       public         heap    postgres    false            ?            1259    32769    usuario    TABLE     Z   CREATE TABLE public.usuario (
    id integer NOT NULL,
    email character varying(30)
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            ?          0    32786 
   comentario 
   TABLE DATA           K   COPY public.comentario (id, usuario_id, post_id, texto, fecha) FROM stdin;
    public          postgres    false    211   x       ?          0    32774    post 
   TABLE DATA           =   COPY public.post (id, usuario_id, titulo, fecha) FROM stdin;
    public          postgres    false    210   A       ?          0    32769    usuario 
   TABLE DATA           ,   COPY public.usuario (id, email) FROM stdin;
    public          postgres    false    209          h           2606    32792    comentario comentario_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.comentario DROP CONSTRAINT comentario_pkey;
       public            postgres    false    211            f           2606    32780    post post_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.post DROP CONSTRAINT post_pkey;
       public            postgres    false    210            d           2606    32773    usuario usuario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    209            k           2606    32798 "   comentario comentario_post_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.post(id);
 L   ALTER TABLE ONLY public.comentario DROP CONSTRAINT comentario_post_id_fkey;
       public          postgres    false    3174    210    211            j           2606    32793 %   comentario comentario_usuario_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);
 O   ALTER TABLE ONLY public.comentario DROP CONSTRAINT comentario_usuario_id_fkey;
       public          postgres    false    209    211    3172            i           2606    32781    post post_usuario_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);
 C   ALTER TABLE ONLY public.post DROP CONSTRAINT post_usuario_id_fkey;
       public          postgres    false    210    3172    209            ?   ?   x?u?K?0D??)r????? ?`?PH@%??W?6??=?x@?2]??????r???????\H??ŗ?W?$('????0??A?I&N??B?L"gmc???>`F?
??ظQ?۴?&x??j?????JfN`???#@??9
kNP??0?`+??8Рh?ݭ ? R?va?*???      ?   ?   x???=?0??>E/?????s @ـ-?),M??9?{???4??i?2??m$#?hf%_????ms?ϔ׵??c.??
;???<?c?"??)V??Q4?[???&??*?[P"?61m-Ǚ???]"1????`D ?0t?y????^C4j???E??Xඨ????s?|?1??f??      ?   [   x?U̽
? ???s1???y!-ҐBr?r?]^^??????*S???z??)?JTC??j?????????????p????8?&??K?Fy     